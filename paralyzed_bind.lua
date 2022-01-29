paralyzed_bind = paralyzed_bind or {
    triggers = {},
    state = {}
}

function paralyzed_bind:check_for_paralyzed()
    local own_data = gmcp.objects.data[tostring(ateam.my_id)]
    if own_data and own_data.paralyzed ~= nil then
        self:toggle(own_data.paralyzed)
    end
    if own_data and own_data.editing ~= nil then
        self:toggle(own_data.editing)
    end
end

function paralyzed_bind:toggle(state)
    if state then
        self:on()
    else
        self:off()
    end
end

function paralyzed_bind:on()
    scripts.utils.bind_functional("przestan", silent)
    self:dim_map_on()
end

function paralyzed_bind:off()
    self:dim_map_off()
end

function paralyzed_bind:dim_map_on()
    testlabel = Geyser.Label:new({
        name = "dimmedMapLabel",
        x = "0", y = "0",
        width = "100%", height = "100%",
    },scripts.ui.bottom)

    --name = "scripts.ui.bottom",
    testlabel:setColor(100,0,0,80)
end

function paralyzed_bind:dim_map_off()
    if testlabel then
        testlabel:hide()
    end
end


function paralyzed_bind:clear_state()
    self.state = {}
end

function paralyzed_bind:init()
    self.handler_data  = scripts.event_register:register_singleton_event_handler(self.handler_data, "gmcp.objects.data", function() self:check_for_paralyzed() end)
end

paralyzed_bind:init()
