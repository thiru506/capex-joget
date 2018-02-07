ProcessStatus = function (data, canvas, m, o) {
    this.data = data;
    this.canvas = canvas;
    this.m = m;
    this.o = o;
    var ps = this;
    $(window).resize(function(){
        ps.autoLayout();
    });
};
ProcessStatus.prototype = {
    xpdlModels : [],
    data : null,
    canvas : null,
    connections : [],
    gap : 60,

    loadXpdl : function(id, xpdl) {
        var model = ProcessBuilder.Designer.parseXPDL(xpdl);
        this.xpdlModels[id] = model;
    },
    
    initTip : function() {
        this.canvas.find(".node").each(function() {
            $(this).qtip({
                content: {
                    text: $(this).find('.extra_info')
                },
                position: {
                  my: 'top center',
                  at: 'bottom center'
                },
                style: {
                  classes: 'qtip-bootstrap'
                },
                show: {
                    event: 'click mouseenter'
                }
            });
        });
    },
    
    autoLayout: function() {
        var processStatus = this;
        this.clearConnections();
        var connections = this.connections;
        var mode = "leftToRight";
        if ($(this.canvas).width() <= 760) {
            mode = "topToBottom";
        }
        $(this.canvas).find(".process_container").each(function(){
            var pc = this;
            var g = new dagre.graphlib.Graph();
            g.setGraph({});
            g.setDefaultEdgeLabel(function() { return {}; });
            var nodes = $(pc).find(".senode, .node"); 
            for (var i = 0; i < nodes.length; i++) {
                var n = nodes[i];
                var width = $(n).height();
                var height = $(n).width() + processStatus.gap;
                if (mode === "topToBottom") {
                    width = $(n).width() + processStatus.gap;
                    height = $(n).height();
                }
                g.setNode($(n).attr("id"), {width: width, height: height});
            }
            for (var i = 0; i < connections.length; i++) {
                var c = connections[i];
                if ($(pc).find("#"+c.source).length > 0) {
                    g.setEdge(c.source,c.target);
                }
            }
            // calculate the layout (i.e. node positions)
            dagre.layout(g);
            
            // Applying the calculated layout
            g.nodes().forEach(function(v) {
                var el = $("#" + v);
                if (mode === "topToBottom") {
                    
                    var left = g.node(v).x;
                    var top = g.node(v).y;
                    
                    if (el.hasClass("start")) {
                        left += 35;
                    }
                    if (el.hasClass("end")) {
                        left += 35;
                        top += 35;
                    }
                    
                    el.css("left", left + "px");
                    el.css("top",  top + "px");
                } else {
                    var left = g.node(v).y - 100;
                    var top = g.node(v).x;
                    
                    if (el.hasClass("start")) {
                        top += 23;
                        left += processStatus.gap;
                    }
                    if (el.hasClass("end")) {
                        top += 23;
                    }
                    
                    el.css("left", left + "px");
                    el.css("top",  top + "px");
                }
            });
            
            if (mode === "topToBottom") {
                $(pc).css("height", (g.graph().height + 100) + "px");
            } else {
                $(pc).css("height", (g.graph().width + 100) + "px");
            }
        });

        this.connectNodes(mode);
    },

    draw : function () {
        this.clear();
        for (var i = 0; i < this.data.length; i++) {
            if (this.data[i].status === undefined) {
                this.drawProcess(this.data[i]);
            }
        }
        
        this.drawEndNode();
        this.autoLayout();
        this.initTip();
    },

    drawProcess : function(processData, processContainer, startNodeLink, activeNodes) {
        processData.status = "drawing";
        var pId = processData.process.id;
        var processModel = this.getProcessModel(processData.process);
        var migratedProcessData = null;
        if ("closed.aborted" === processData.process.state) {
            migratedProcessData = this.getSubflowData(processData.process.instanceId, null, pId);
        }

        if (processContainer === undefined || processContainer === null) {
            processContainer = this.createProcessContainer(processData, processModel);
        }

        if (activeNodes === undefined || activeNodes === null) {
            if (startNodeLink === undefined || startNodeLink === null) {
                var startNode = this.createStartNode(processContainer, processData);
                startNodeLink = [$(startNode).attr("id")];
            }

            activeNodes = {};
            var firstActivity = this.getStartNode(processModel);
            activeNodes[pId+"_"+firstActivity.id] = {
                links : startNodeLink
            };
        }

        var lastActId = null;

        //loop through the process data
        for (var a = 0; a < processData.activities.length; a++) {
            var act = processData.activities[a];
            if (migratedProcessData !== null && act.state === "closed.aborted") {
                //ignore
            } else {
                var tempActiveNode = activeNodes[pId+"_"+act.activityDefId];
                var actModel = this.getActivityModel(processModel, act.activityDefId);
                var links = [act.id];
                if (actModel.type === "activity") {
                    this.createNode(processContainer, act, tempActiveNode.links);
                    lastActId = act.id;
                } else if (actModel.type === "subflow") {
                    var subflowData = this.getSubflowData(processData.process.instanceId, processData.process.version, actModel.subflowId);
                    var returnActId = this.drawProcess(subflowData, processContainer, tempActiveNode.links);
                    if (actModel.execution === "SYNCHR") {
                        links = [returnActId];
                    } else {
                        links = tempActiveNode.links;
                    }
                } else {
                    links = tempActiveNode.links;
                }

                if (actModel.splitTransitions !== undefined) {
                    for (var t=0; t<actModel.splitTransitions.length; t++) {
                        var transition = this.getTransitionModel(processModel, actModel.splitTransitions[t]);
                        var toNodeModel = this.getActivityModel(processModel, transition.to);
                        var toActiveNode = activeNodes[pId+"_"+transition.to];
                        if (toNodeModel.join !== "AND") {
                            toActiveNode = null;
                        }
                        if (toActiveNode === undefined || toActiveNode === null) {
                            toActiveNode = {
                                links : links
                            };
                        } else {
                            for (var l = 0; l < links.length; l++) {
                                toActiveNode.links.push(links[l]);
                            }
                        }
                        activeNodes[pId+"_"+transition.to] = toActiveNode;
                    }
                }

                delete activeNodes[pId+"_"+act.activityDefId];
            }
        }
        if (migratedProcessData !== null) {
            this.drawProcess(migratedProcessData, processContainer, null, activeNodes);
        }

        processData.status = "done";
        return lastActId;
    },
    
    drawEndNode : function() {
        var connections = this.connections;
        $(this.canvas).find(".process_container").each(function(){
            var pc = this;
            $(pc).find(".node").each(function(){
                var id = $(this).attr("id");
                var addEndNode = true;
                if ($(this).hasClass("running")) {
                    addEndNode = false;
                } else {
                    for (var c = 0; c < connections.length; c++) {
                        if (connections[c].source === id) {
                            addEndNode = false;
                            break;
                        }
                    }
                }
                if (addEndNode) {
                    $(this).after("<div class='senode end' id='"+id+"_endNode'></div>");
                    connections.push({source:id, target: id+"_endNode"});
                }
            });
        });
    },

    createProcessContainer : function (processData, processModel) {
        if (this.o.showProcessName !== undefined && this.o.showProcessName !== null && this.o.showProcessName === "true") {
            $(this.canvas).append("<h2 class=\"process_title\">"+processData.process.name+"</h2>");
        }
        $(this.canvas).append("<div id=\""+processData.process.instanceId+"\" class=\"process_container\"></div>");
        var container = $(this.canvas).find("#"+processData.process.instanceId);
        
        return container;
    },

    createStartNode : function(processContainer, processData) {
        var id = processData.process.instanceId + "_runProcess";
        
        $(processContainer).append("<div class='senode start' id='"+id+"_startNode'></div>");
        this.connections.push({source:id+"_startNode", target: id});
                    
        var nodeData = {
            "acceptedUser": processData.process.requesterId,
            "activityDefId": "runProcess",
            "createdTime": processData.process.createdTime,
            "id": id,
            "name": this.m["start.activity"],
            "state": "closed.completed"
        };

        return this.createNode(processContainer, nodeData);
    },

    createNode : function(processContainer, nodeData, connectedNodes) {
        var status = "running";
        if (nodeData.state === "closed.aborted") {
            status = "aborted";
        } else if (nodeData.state === "closed.completed") {
            status = "completed";
        } else if (nodeData.state === "closed.terminated") {
            status = "terminated";
        }

        $(processContainer).append("<div class='node "+status+"' id='"+nodeData.id+"'></div>");
        var node = $(processContainer).find("#"+nodeData.id);
        node.append("<h5 class='node_name'>"+nodeData.name+"</h5>");
        if (status === "completed") {
            node.append("<span class='node_performer'>"+nodeData.acceptedUser+"</h5>");
        }
        var extraInfo = $("<div class='extra_info' style='display:none;'></div>");
        $(extraInfo).append("<span class='node_meta node_status'>"+this.m["node.status"]+this.m["status."+status]+"</span>");
        if (status === "running") {
            $(extraInfo).append("<span class='node_meta node_assignee'>"+this.m["node.assignees"]+nodeData.assignmentUsers.join(", ")+"</span>");
        }
        $(extraInfo).append("<span class='node_meta node_created'>"+this.m["node.createdTime"]+nodeData.createdTime+"</span>");
        if (nodeData.finishTime !== undefined && status !== "running") {
            $(extraInfo).append("<span class='node_meta node_finished'>"+this.m["node.finishedTime"]+nodeData.finishTime+"</span>");
        }

        node.append(extraInfo);

        if (connectedNodes !== undefined) {
            for (var c = 0; c < connectedNodes.length ; c++) {
                this.connections.push({source:connectedNodes[c], target: nodeData.id});
            }
        }

        return node;
    },

    clear : function () {
        this.clearConnections();
        $(this.canvas).empty();
    },
    
    clearConnections : function() {
        ProcessBuilder.Util.jsPlumb.unbind();
        ProcessBuilder.Util.jsPlumb.detachEveryConnection();
        ProcessBuilder.Util.jsPlumb.reset();
    },
    
    connectNodes : function(mode) {
        var connector = connector = ["Straight", {stub: 0}];
        
        // init jsPlumb
        ProcessBuilder.Util.jsPlumb.importDefaults({
            Container: "canvas",
            Anchor: "Continuous",
            Endpoint: ["Dot", {radius: 3}],
            PaintStyle: {strokeStyle: "#000", lineWidth: 1},
            Connector : connector,
            ConnectionOverlays: [
                ["Arrow", {
                    location: 1,
                    id: "arrow",
                    length: 10,
                    width: 10,
                    foldback: 0.8
                }]
            ],
            ConnectionsDetachable: ProcessBuilder.Designer.editable
        });
    
        for (var c = 0; c < this.connections.length; c++) {
            ProcessBuilder.Util.jsPlumb.connect(this.connections[c]);
        }
    },

    getSubflowData : function(parentId, version, processId) {
        for (var i = 0; i < this.data.length; i++) {
            var o = this.data[i];
            if (o.status === undefined && o.process.id === processId && ((version !== null && o.process.version === version) || version === null) && o.link.parentId === parentId) {
                return o;
            }
        }
        return null;
    },

    getProcessModel : function (processData) {
        var package = this.xpdlModels[processData.packageId + "__" + processData.version];
        return package.processes[processData.id];
    },

    getTransitionModel : function(processModel, id) {
        for (var i = 0; i < processModel.transitions.length; i++) {
            if (processModel.transitions[i].id === id) {
                return processModel.transitions[i];
            }
        }
        return null;
    },

    getStartNode : function(processModel) {
        for (var property in processModel.startEndNodes) {
            if (processModel.startEndNodes[property].type === "start") {
                return processModel.startEndNodes[property];
            }
        }
        return null;
    },

    getActivityModel : function(processModel, actId) {
        return processModel.activities[actId];
    }
};
