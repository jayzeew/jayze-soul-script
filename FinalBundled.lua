-- ===== STRONGER GLOBAL FIX =====
local env = getfenv()
_G.Action = _G.Action or {}
function _G.Action.new() 
    return { _when = 0, _type = "", hitbox = Vector3.new(0,0,0), name = "", ihbc = false, 
             start = function() end, update = function() end } 
end

_G.Signal = _G.Signal or {}
function _G.Signal.new(owner)
    local cons = {}
    return { connect = function(self, name, cb) table.insert(cons, cb) return { Disconnect = function() end } end,
             fire = function(self, ...) for _, cb in ipairs(cons) do cb(...) end end }
end

_G.PartTiming = _G.PartTiming or {}
function _G.PartTiming.new()
    return { uhc = false, fhb = false, duih = false, name = "", hitbox = Vector3.new(0,0,0),
             actions = { push = function(self, a) table.insert(self, a) end } }
end

_G.Defense = { cdpo = function() end }
_G.RepeatInfo = { new = function() return {} end }
_G.Profiler = { run = function(name, f) f() end }
_G.Logger = { warn = function(...) warn(...) end, notify = function(...) print(...) end }
_G.PersistentData = { init = function() end, get = function() return nil end, set = function() end }
_G.PlayerScanning = { init = function() end, detach = function() end }
_G.Keybinding = { init = function() end, detach = function() end }
_G.CoreGuiManager = { set = function() end, clear = function() end }
_G.SaveManager = { init = function() end, detach = function() end, LoadAutoloadConfig = function() end }
_G.ModuleManager = { refresh = function() end, detach = function() end }
_G.ControlModule = { init = function() end, detach = function() end }
_G.Options = { MenuKeybind = "Insert" }
_G.Configuration = { expectToggleValue = function() return false end }
_G.shared = _G.shared or {}
_G.LRM_SEND_WEBHOOK = function() end
_G.LRM_SANITIZE = function(a,b) return a end

-- Make sure getfenv also sees them
for k, v in pairs(_G) do
    if getfenv()[k] == nil then
        getfenv()[k] = v
    end
end
-- ===== END OF FIX =====

--[[ AUTO-BUNDLED WITH MODULE SYSTEM ]]--
local _MODULES = {}
local function require(name)
    local mod = _MODULES[name]
    if not mod then error('Module not found: '..name) end
    if type(mod) == 'function' then
        _MODULES[name] = mod()
        return _MODULES[name]
    end
    return mod
end
getfenv().require = require

_MODULES["ArranMura"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 580
	if distance >= 15 then
		action._when = math.min(590 + distance * 5, 1000)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(22, 15, 36)
	action.name = string.format("(%.2f) Dynamic Arrancar Murasama Crit Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["ArranMura1"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 550
	if distance >= 15 then
		action._when = math.min(550 + distance * 6.2, 1000)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(22, 15, 36)
	action.name = string.format("(%.2f) Dynamic Arrancar Murasama Crit Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["BalaDrive"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(600 + distance * 5.5, 1400)
	action._type = "Start Block"
	action.hitbox = Vector3.new(60, 20, 60)
	action.name = string.format("(%.2f) Dynamic Bala Drive Timing", distance)
	self:action(timing, action)

	local action2 = Action.new()
	action2._when = 1000
	action2._type = "End Block"
	action2.hitbox = Vector3.new(200, 200, 200)
	action2.name = string.format("(2) (%.2f) Dynamic Timing", distance)
	self:action(timing, action2)
end

end

_MODULES["BalaGum"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(480 + distance * 5.5, 1100)
	action._type = "Parry"
	action.hitbox = Vector3.new(60, 20, 60)
	action.name = string.format("(%.2f) Dynamic Bala Gum Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["BladeCero"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 120)
	action.name = string.format("(%.2f - %.2f) Dynamic Keyframe Action", distance, self.track.Speed)

	local tp = 1.0

	if distance >= 20 then
		tp = 1.1
	end

	if distance >= 25 then
		tp = 1.12
	end

	if distance >= 30 then
		tp = 1.15
	end

	if distance >= 35 then
		tp = 1.18
	end

	if distance >= 40 then
		tp = 1.2
	end

	return self:akeyframe(action, tp)
end

end

_MODULES["Blossom"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(140 + distance * 6.5, 500)
	action._type = "Parry"
	action.hitbox = Vector3.new(60, 15, 70)
	action.name = string.format("(%.2f) Dynamic Blossom Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["BlueScytheCrit"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 700
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 25)
	action.name = string.format("(%.2f) Dynamic Blue Scythe Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["BowShot"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(930 + distance * 5.6, 3000)
	action._type = "Start Block"
	action.hitbox = Vector3.new(70, 80, 100)
	action.name = string.format("(%.2f) Dynamic Bow Shot Timing", distance)
	self:action(timing, action)

	local action2 = Action.new()
	action2._when = math.min(1100 + distance * 7, 3000)
	action2._type = "End Block"
	action2.hitbox = Vector3.new(120, 120, 150)
	self:action(timing, action2)
end

end

_MODULES["Carve"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = 360
	if distance >= 16 then
		action._when = math.min(150 + distance * 18, 1000)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(22, 15, 35)
	action.name = string.format("(%.2f) Dynamic Carving Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["CeroOscuras"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local action = Action.new()
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 120)
	action.name = "Keyframe Action"
	return self:akeyframe(action, 1.41)
end

end

_MODULES["ClawCrit"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 350
	if distance >= 13 then
		action._when = math.min(350 + distance * 10.8, 1000)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(20, 15, 32)
	action.name = string.format("(%.2f) Dynamic Claw Crit Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["Confliction"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 370
	if distance >= 8 then
		action._when = math.min(400 + distance * 13.1, 1500)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(14, 15, 20)
	action.name = string.format("(%.2f) Dynamic Confliction Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["Dagger"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(370 + distance * 16, 1000)
	action._type = "Parry"
	action.hitbox = Vector3.new(20, 15, 31)
	action.name = string.format("(%.2f) Dynamic Dagger Spinny Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["DaggerM1"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	repeat
		task.wait()
	until self.track.TimePosition >= 0.30

	local action = Action.new()
	action._when = 0
	action._type = "Parry"
	action.hitbox = Vector3.new(12, 14, 11)
	action.name = string.format("(%.2f) Dynamic Dagger M1 Timing", self.track.Speed)
	self:action(timing, action)
end

end

_MODULES["DeathFlair"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local action = Action.new()
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 15)
	action.name = "Keyframe Action"
	return self:akeyframe(action, 1.135)
end

end

_MODULES["DeathFlairAir"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local action = Action.new()
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 15)
	action.name = "Keyframe Action"
	return self:akeyframe(action, 0.4)
end

end

_MODULES["DelayedDeath"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(690 + distance * 2.5, 1200)
	action._type = "Parry"
	action.hitbox = Vector3.new(100, 30, 120)
	action.name = string.format("(%.2f) Dynamic Delayed Death Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Desgar"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(520 + distance * 3, 1300)
	action._type = "Parry"
	action.hitbox = Vector3.new(20, 15, 80)
	action.name = string.format("(%.2f) Dynamic Desgar Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["DestelloThrow"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(340 + distance * 12, 1300)
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 80)
	action.name = string.format("(%.2f) Dynamic Destello Spear Throw Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Diggimon"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(750 + distance * 6, 1500)
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 100)
	action.name = string.format("(%.2f) Dynamic X-Axis Gun Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["DualCrit"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 430
	if distance >= 12 then
		action._when = 570
	end
	if distance >= 14 then
		action._when = 630
	end
	if distance >= 16 then
		action._when = 650
	end
	if distance >= 18 then
		action._when = 690
	end
	if distance >= 20 then
		action._when = 730
	end
	if distance >= 22 then
		action._when = 760
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(18, 15, 33)
	action.name = string.format("(%.2f) Dynamic Dual Crit Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["DukeStomp"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(430 + distance * 13, 2500)
	action._type = "Parry"
	action.hitbox = Vector3.new(40, 30, 120)
	action.name = string.format("(%.2f) Dynamic Duke Stomp Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Ethereal"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 440
	if distance >= 13 then
		action._when = math.min(240 + distance * 20, 5000)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(33, 20, 80)
	action.name = string.format("(%.2f) Dynamic Ethereal Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["Evis"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 620
	if distance >= 15 then
		action._when = math.min(640 + distance * 4, 1200)
	end
	action._type = "Start Block"
	action.hitbox = Vector3.new(60, 30, 37)
	action.name = string.format("(%.2f) Dynamic Evisorate Timing", distance)
	self:action(timing, action)

	local action2 = Action.new()
	action2._when = 1325
	action2._type = "End Block"
	action2.hitbox = Vector3.new(100, 100, 100)
	action2.name = string.format("(2) (%.2f) Dynamic Evisorate Timing", distance)
	self:action(timing, action2)
end

end

_MODULES["Fear"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = 680
	if distance >= 9 then
		action._when = math.min(750 + distance * 19, 1000)
	end
	if distance >= 21 then
		action._when = math.min(990 + distance * 2, 1800)
	end
	action._type = "Start Block"
	action.hitbox = Vector3.new(81, 70, 81)
	action.name = string.format("(%.2f) Dynamic Fear Timing", distance)
	self:action(timing, action)

	local action2 = Action.new()
	action2._when = 2000
	action2._type = "End Block"
	action2.hitbox = Vector3.new(120, 120, 120)
	self:action(timing, action2)
end

end

_MODULES["FingerCero"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local action = Action.new()
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 120)
	action.name = "Keyframe Action"
	return self:akeyframe(action, 0.5)
end

end

_MODULES["FireGSCrit"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	repeat
		task.wait()
	until self.track.TimePosition >= 0.75
	local action = Action.new()
	action._when = 0
	if distance >= 20 then
		action._when = math.min(1 + distance * 3, 1500)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(25, 20, 80)
	action.name = string.format("(%.2f) Dynamic Fire GS Neutral Crit Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["GalvanoBeam"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = math.min(440 + distance * 6.5, 1500)
	action._type = "Parry"
	action.hitbox = Vector3.new(80, 40, 119)
	action.name = string.format("(%.2f) Dynamic Galvano Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Gehenna"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 270
	if distance >= 6 then
		action._when = 390
	end
	if distance >= 10 then
		action._when = math.min(410 + distance * 25, 1000)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(45, 45, 45)
	action.name = string.format("(%.2f) Dynamic Gehenna Followup Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["GinCrit"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(600 + distance * 1, 1300)
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 40)
	action.name = string.format("(%.2f) Dynamic Gin Crit Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["HakudaCrit"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 430
	if distance >= 12 then
		action._when = 570
	end
	if distance >= 14 then
		action._when = 630
	end
	if distance >= 16 then
		action._when = 650
	end
	if distance >= 18 then
		action._when = 690
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 22)
	action.name = string.format("(%.2f) Dynamic Hakuda Crit Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["HF_104735147027450_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.4)
end
end

_MODULES["HF_106475769642579_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.433)
end
end

_MODULES["HF_109283607506588_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.4)
end
end

_MODULES["HF_111020353010598_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.4)
end
end

_MODULES["HF_116595150441085_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.4)
end
end

_MODULES["HF_116811469180699_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.4)
end
end

_MODULES["HF_122334177552891_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.4)
end
end

_MODULES["HF_127467569960299_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.4)
end
end

_MODULES["HF_133708496404916_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.417)
end
end

_MODULES["HF_14068978735_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.6)
end
end

_MODULES["HF_14069034915_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.633)
end
end

_MODULES["HF_14069058915_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.417)
end
end

_MODULES["HF_14069061280_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.433)
end
end

_MODULES["HF_14069063230_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.417)
end
end

_MODULES["HF_14069065165_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.425)
end
end

_MODULES["HF_14069066675_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.6)
end
end

_MODULES["HF_14069413304_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.433)
end
end

_MODULES["HF_14069414178_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.45)
end
end

_MODULES["HF_14069418978_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.567)
end
end

_MODULES["HF_14069465592_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.483)
end
end

_MODULES["HF_14070244842_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.533)
end
end

_MODULES["HF_14070253349_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.417)
end
end

_MODULES["HF_14070254724_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.417)
end
end

_MODULES["HF_14070255779_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.417)
end
end

_MODULES["HF_14070257029_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.417)
end
end

_MODULES["HF_14070257930_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.433)
end
end

_MODULES["HF_14070270084_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.533)
end
end

_MODULES["HF_14070297611_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.417)
end
end

_MODULES["HF_14070301171_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.417)
end
end

_MODULES["HF_14070302098_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.433)
end
end

_MODULES["HF_14070325851_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.533)
end
end

_MODULES["HF_14070335315_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.417)
end
end

_MODULES["HF_14070336542_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.417)
end
end

_MODULES["HF_14070337700_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.417)
end
end

_MODULES["HF_14070338988_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.417)
end
end

_MODULES["HF_14070340037_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.433)
end
end

_MODULES["HF_14071361441_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.5)
end
end

_MODULES["HF_14071556976_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.6)
end
end

_MODULES["HF_14071655810_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.45)
end
end

_MODULES["HF_14071671623_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.567)
end
end

_MODULES["HF_14071712668_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.7)
end
end

_MODULES["HF_14843282968_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local action = Action.new()
	action._type = "Parry"
	action.hitbox = Vector3.new(30, 30, 30)
	action.name = "Keyframe Action"
	return self:akeyframe(action, 0.35)
end

end

_MODULES["HF_14843286913_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.383)
end
end

_MODULES["HF_14843288316_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.383)
end
end

_MODULES["HF_17071010713_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.4)
end
end

_MODULES["HF_17071045178_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.4)
end
end

_MODULES["HF_17071146153_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.533)
end
end

_MODULES["HF_17585437853_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.358)
end
end

_MODULES["HF_17900275042_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.533)
end
end

_MODULES["HF_18271774483_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local action = Action.new()
	action._type = "Parry"
	action.hitbox = Vector3.new(30, 30, 30)
	action.name = "Keyframe Action"
	return self:akeyframe(action, 1.0)
end

end

_MODULES["HF_18838191479_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.533)
end
end

_MODULES["HF_18869318338_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.4)
end
end

_MODULES["HF_18869326330_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.367)
end
end

_MODULES["HF_18869335671_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.4)
end
end

_MODULES["HF_18869341514_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.35)
end
end

_MODULES["HF_18869350385_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.383)
end
end

_MODULES["HF_72125476813742_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.417)
end
end

_MODULES["HF_80933072062076_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.1)
end
end

_MODULES["HF_84000459841794_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.417)
end
end

_MODULES["HF_87357618406139_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.533)
end
end

_MODULES["HF_95137636416866_AutoGenerated"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
    local action = Action.new()
    action._type = "Parry"
    action.hitbox = Vector3.new(30, 30, 30)
    action.name = "Keyframe Action"
    return self:akeyframe(action, 0.683)
end
end

_MODULES["HorseThrow"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(980 + distance * 6.6, 3000)
	action._type = "Parry"
	action.hitbox = Vector3.new(35, 35, 200)
	action.name = string.format("(%.2f) Dynamic Horse Z Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Ink"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(910 + distance * 12, 2000)
	action._type = "Parry"
	action.hitbox = Vector3.new(75, 30, 75)
	action.name = string.format("(%.2f) Dynamic Ink C Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Itto"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(1880 + distance * 6, 2500)
	action._type = "Parry"
	action.hitbox = Vector3.new(20, 15, 30)
	action.name = string.format("(%.2f) Dynamic Itto Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Justice"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 400
	if distance >= 21 then
		action._when = 660
	end
	if distance >= 42 then
		action._when = 900
	end
	if distance >= 64 then
		action._when = 1180
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(30, 20, 100)
	action.name = string.format("(%.2f) Dynamic Justice Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["Kick"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(1250 + distance * 5, 2500)
	action._type = "Parry"
	action.hitbox = Vector3.new(150, 120, 150)
	action.name = string.format("(%.2f) Dynamic Bomb Kick Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["KisukeMove"] = function()
-- Timestamp.
local lastShadowTimestamp = nil

---@class Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	if self:distance(self.entity) > 12 then
		return
	end

	if lastShadowTimestamp and os.clock() - lastShadowTimestamp <= 1.0 then
		return
	end

	self:hook("target", function()
		return true
	end)

	lastShadowTimestamp = os.clock()

	timing.fhb = false

	local action = Action.new()
	action._when = 290
	action._type = "Parry"
	action.ihbc = false
	action.hitbox = Vector3.new(25, 25, 25)
	action.name = "Shadow Timing"
	self:action(timing, action)
end

end

_MODULES["Lebron"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(2550 + distance * 4, 3300)
	action._type = "Dash"
	action.hitbox = Vector3.new(75, 75, 85)
	action.name = string.format("(%.2f) Dynamic Lebron Dunk Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Lejos"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(900 + distance * 4, 1300)
	action._type = "Parry"
	action.hitbox = Vector3.new(30, 15, 30)
	action.name = string.format("(%.2f) Dynamic Lejos Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["LightningShunko"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(530 + distance * 4, 1300)
	action._type = "Parry"
	action.hitbox = Vector3.new(25, 15, 60)
	action.name = string.format("(%.2f) Dynamic Lightning Shunko Crit Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Longsword"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 350
	if distance >= 15 then
		action._when = 330
	end
	if distance >= 20 then
		action._when = 500
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(17, 15, 28)
	action.name = string.format("(%.2f) Dynamic Longsword Crit Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["LowRuler"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(750 + distance * 1.9, 1200)
	action._type = "Dash"
	action.hitbox = Vector3.new(150, 100, 150)
	action.name = string.format("(%.2f) Dynamic Low Ruler Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Lunge"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(170 + distance * 16.5, 650)
	if distance >= 29 then
		action._when = math.min(500 + distance * 3.6, 1000)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(23, 15, 45)
	action.name = string.format("(%.2f) Dynamic Accelerate Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Magma"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(810 + distance * 11, 1700)
	action._type = "Dash"
	action.hitbox = Vector3.new(24, 20, 60)
	action.name = string.format("(%.2f) Dynamic Magma Plume Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Massbreaker"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(880 + distance * 6.8, 2000)
	action._type = "Parry"
	action.hitbox = Vector3.new(35, 20, 80)
	action.name = string.format("(%.2f) Dynamic Massbreaker Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["MedicalRod"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()

	-- pattern seems to be for every distance increment of 12 += 50
	-- 3 : 1100
	-- 9-11 : 1150
	-- 11-23 : 1200
	-- 23-34: 1250

	action._when = 850

	if distance >= 12 then
		action._when += math.floor(distance / 12) * 60
	end

	action._type = "Parry"
	action.hitbox = Vector3.new(100, 30, 300)
	action.name = string.format("(%.2f) Dynamic Medical Rod Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Mura1"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local action = Action.new()
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 12)
	action.name = "Keyframe Action"
	return self:akeyframe(action, 0.40)
end

end

_MODULES["Mura2"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local action = Action.new()
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 12)
	action.name = "Keyframe Action"
	return self:akeyframe(action, 0.33)
end

end

_MODULES["Mura3"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local action = Action.new()
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 12)
	action.name = "Keyframe Action"
	return self:akeyframe(action, 0.50)
end

end

_MODULES["Mura4"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local action = Action.new()
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 12)
	action.name = "Keyframe Action"
	return self:akeyframe(action, 0.48)
end

end

_MODULES["Mura5"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local action = Action.new()
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 12)
	action.name = "Keyframe Action"
	return self:akeyframe(action, 0.38)
end

end

_MODULES["MuraQuincy"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(970 + distance * 3, 1400)
	action._type = "Parry"
	action.hitbox = Vector3.new(25, 25, 75)
	action.name = string.format("(%.2f) Dynamic Murasama Quincy Crit Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Nake"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(310 + distance * 4, 900)
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 60)
	action.name = string.format("(%.2f) Dynamic Nake Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["NelCrit"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(520 + distance * 13, 900)
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 30)
	action.name = string.format("(%.2f) Dynamic Nel Crit Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["NelsLance"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 650
	if distance >= 18 then
		action._when = 680
	end
	if distance >= 20 then
		action._when = 700
	end
	if distance >= 22 then
		action._when = 720
	end
	if distance >= 24 then
		action._when = 880
	end
	if distance >= 26 then
		action._when = 950
	end
	if distance >= 28 then
		action._when = 990
	end
	if distance >= 30 then
		action._when = 1040
	end
	if distance >= 32 then
		action._when = 1080
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(20, 15, 33)
	action.name = string.format("(%.2f) Dynamic Nels Lance Crit Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["NervePull"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = math.min(420 + distance * 4, 750)
	if distance >= 26 then
		action._when = math.min(285 + distance * 18, 1700)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(55, 20, 70)
	action.name = string.format("(%.2f) Dynamic Nerve Pull Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["Passage"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 750
	if distance >= 15 then
		action._when = math.min(795 + distance * 12.4, 2200)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(28, 20, 30)
	action.name = string.format("(%.2f) Dynamic Flowing Passage Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["Phase"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(720 + distance * 3, 800)
	if distance >= 20 then
		action._when = math.min(750 + distance * 6, 1400)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(30, 15, 60)
	action.name = string.format("(%.2f) Dynamic Phase Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Phoenix"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(600 + distance * 15, 2000)
	action._type = "Parry"
	action.hitbox = Vector3.new(30, 25, 60)
	action.name = string.format("(%.2f) Dynamic Phoenix Dive Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["PiercerCrit"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(350 + distance * 6, 900)
	action._type = "Parry"
	action.hitbox = Vector3.new(18, 15, 45)
	action.name = string.format("(1) (%.2f) Dynamic Crit Timing", distance)
	self:action(timing, action)

	local action2 = Action.new()
	action2._when = math.min(710 + distance * 6, 900)
	action2._type = "Parry"
	action2.hitbox = Vector3.new(18, 15, 45)
	action2.name = string.format("(2) (%.2f) Dynamic Crit Timing", distance)
	self:action(timing, action2)
end

end

_MODULES["Pillars"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(500 + distance * 3, 800)
	action._type = "Parry"
	action.hitbox = Vector3.new(150, 40, 150)
	action.name = string.format("(%.2f) Dynamic Visionary Pillars Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Power"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(520 + distance * 15.1, 1300)
	action._type = "Parry"
	action.hitbox = Vector3.new(40, 25, 32)
	action.name = string.format("(%.2f) Dynamic Power Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Prismatic"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 290
	if distance >= 7 then
		action._when = math.min(310 + distance * 5.2, 700)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(90, 30, 90)
	action.name = string.format("(%.2f) Dynamic Prismatic Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["Quilge"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(290 + distance * 15, 1300)
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 40)
	action.name = string.format("(%.2f) Dynamic Quilge Crit Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Rai"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 410
	if distance >= 10 then
		action._when = math.min(300 + distance * 14, 1100)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(18, 15, 35)
	action.name = string.format("(%.2f) Dynamic Raikoho Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["RapierCrit"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 340
	if distance >= 15 then
		action._when = math.min(330 + distance * 15, 1000)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(14, 14, 23)
	action.name = string.format("(%.2f) Dynamic Rapier Crit Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["Reaper"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(280 + distance * 11, 800)
	action._type = "Parry"
	action.hitbox = Vector3.new(18, 15, 20)
	action.name = string.format("(%.2f) Dynamic Reaper's Hook Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["ReiatsuDisk"] = function()
---@type Action
local Action = getfenv().Action

---@type Signal
local Signal = getfenv().Signal

---@type PartTiming
local PartTiming = getfenv().PartTiming

---@module Features.Combat.Defense
local Defense = getfenv().Defense

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local effects = workspace:FindFirstChild("Effects")
	local peffects = effects and effects:FindFirstChild(self.entity.Name)
	if not peffects then
		return
	end

	local distance = self:distance(self.entity)

	if distance <= 15 then
		local action = Action.new()
		action._when = 400
		action._type = "Start Block"
		action.ihbc = true
		action.name = "Reiatsu Disk Start Block"
		self:action(timing, action)

		local action2 = Action.new()
		action2._when = 1300
		action2._type = "End Block"
		action2.ihbc = true
		action2.name = "Reiatsu Disk End Block"
		return self:action(timing, action2)
	end

	local childAdded = Signal.new(peffects.ChildAdded)
	local childConnection = nil

	local function listener(child)
		if child.Name ~= "ReiatsuDisc" then
			return
		end

		if childConnection then
			childConnection:Disconnect()
		end

		local action = Action.new()
		action._when = 0
		action._type = "Parry"
		action.name = "Reiatsu Disk Part"

		local pt = PartTiming.new()
		pt.uhc = true
		pt.fhb = false
		pt.duih = true
		pt.name = "ReiatsuDiskProjectile"
		pt.hitbox = Vector3.new(7, 7, 30)
		pt.actions:push(action)

		Defense.cdpo(child, pt)
	end

	childConnection = childAdded:connect("ReiatsuDisk_ProjectileListener", listener)

	for _, child in next, peffects:GetChildren() do
		listener(child)
	end
end

end

_MODULES["ReiatsuSpike"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(400 + distance * 7, 1600)
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 100)
	action.name = string.format("(%.2f) Dynamic Reiatsu Spike Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["ReishiBomb"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(1300 + distance * 7.6, 2000)
	action._type = "Dash"
	action.hitbox = Vector3.new(140, 50, 140)
	action.name = string.format("(%.2f) Dynamic Reishi Bomb Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["ReishiString"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 700
	if distance >= 13 then
		action._when = math.min(690 + distance * 8.5, 1400)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(27, 15, 27)
	action.name = string.format("(%.2f) Dynamic Reishi String Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["ReishiWave"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(520 + distance * 8, 1600)
	action._type = "Parry"
	action.hitbox = Vector3.new(35, 15, 100)
	action.name = string.format("(%.2f) Dynamic Reishi Wave Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Relief"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(625 + distance * 11, 1300)
	action._type = "Start Block"
	action.hitbox = Vector3.new(30, 15, 60)
	action.name = string.format("(%.2f) Dynamic Crescent Relief Timing", distance)
	self:action(timing, action)

	local action2 = Action.new()
	action2._when = 1600
	action2._type = "End Block"
	action2.hitbox = Vector3.new(200, 200, 200)
	action2.name = string.format("(2) (%.2f) Dynamic Crit Timing", distance)
	self:action(timing, action2)
end

end

_MODULES["Reminisce"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	task.wait(0.1)
	local action = Action.new()
	action._when = (490 * 0.75) / self.track.Speed
	action._type = "Parry"
	action.hitbox = Vector3.new(16, 15, 16)
	action.name = string.format("(%.2f) Dynamic Reminisce Timing", self.track.Speed)
	return self:action(timing, action)
end

end

_MODULES["RingBeam"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local action = Action.new()
	action._when = 2340
	action._type = "Parry"
	action.hitbox = Vector3.new(80, 250, 80)
	action.name = string.format("(Parry) (%.2f) Dynamic Ring Timing", self.track.Speed)

	if self.track.Speed >= 1.45 and self.track.Speed <= 1.55 then
		action._when = 1540
	end

	self:action(timing, action)

	local secondAction = Action.new()
	secondAction._when = 2840
	secondAction._type = "Parry"
	secondAction.hitbox = Vector3.new(80, 250, 80)
	secondAction.name = string.format("(Fire Parry) (%.2f) Dynamic Ring Timing", self.track.Speed)

	if self.track.Speed >= 1.45 and self.track.Speed <= 1.55 then
		secondAction._when = 2035
	end

	self:action(timing, secondAction)

	local thirdAction = Action.new()
	thirdAction._when = 3340
	thirdAction._type = "Parry"
	thirdAction.hitbox = Vector3.new(80, 250, 80)
	thirdAction.name = string.format("(Fire Parry) (%.2f) Dynamic Ring Timing", self.track.Speed)

	if self.track.Speed >= 1.45 and self.track.Speed <= 1.55 then
		thirdAction._when = 2560
	end

	self:action(timing, thirdAction)

	local forthAction = Action.new()
	forthAction._when = 3875
	forthAction._type = "Parry"
	forthAction.hitbox = Vector3.new(80, 250, 80)
	forthAction.name = string.format("(Fire Parry) (%.2f) Dynamic Ring Timing", self.track.Speed)

	if self.track.Speed >= 1.45 and self.track.Speed <= 1.55 then
		forthAction._when = 3085
	end

	self:action(timing, forthAction)
end

end

_MODULES["RingGroundPunch"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	repeat
		task.wait()
	until self.track.TimePosition >= 1.47

	local action = Action.new()
	action._when = 0
	action._type = "Parry"
	action.hitbox = Vector3.new(80, 200, 80)
	action.name = string.format("(%.2f) Dynamic Ring Timing", self.track.Speed)
	self:action(timing, action)
end

end

_MODULES["RingRoar"] = function()
---@module Features.Combat.Objects.RepeatInfo
local RepeatInfo = getfenv().RepeatInfo

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	timing.rpue = true
	timing._rpd = 150
	timing._rsd = 1200
	timing.hitbox = Vector3.new(300, 300, 300)

	if self.track.Speed >= 0.94 and self.track.Speed <= 0.96 then
		timing._rsd = 1150
	end

	if self.track.Speed >= 1.45 and self.track.Speed <= 1.55 then
		timing._rsd = 1200
	end

	local info = RepeatInfo.new(timing)
	info.track = self.track
	info.irdelay = self.rdelay()
	self:rpue(self.entity, timing, info)
end

end

_MODULES["RingStomp"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	repeat
		task.wait()
	until self.track.TimePosition >= 0.98

	local action = Action.new()
	action._when = 0
	action._type = "Parry"
	action.hitbox = Vector3.new(80, 200, 80)
	action.name = string.format("(%.2f) Dynamic Ring Timing", self.track.Speed)
	self:action(timing, action)
end

end

_MODULES["RisingShot"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local action = Action.new()
	action._type = "Parry"
	action.hitbox = Vector3.new(20, 20, 20)
	action.name = "Keyframe Action"
	return self:akeyframe(action, 0.36)
end

end

_MODULES["Scythe"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 350
	if distance >= 13 then
		action._when = 330
	end
	if distance >= 18 then
		action._when = 410
	end
	if distance >= 19 then
		action._when = 520
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 25)
	action.name = string.format("(%.2f) Dynamic Scythe Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["ScytheCrit"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 530
	if distance >= 13 then
		action._when = math.min(450 + distance * 15.2, 1000)
	end
	if distance >= 31 then
		action._when = math.min(950 + distance * 4, 1300)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(27, 15, 40)
	action.name = string.format("(%.2f) Dynamic Scythe Crit Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["SealingPalm"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(510 + distance * 9.3, 1000)
	action._type = "Parry"
	action.hitbox = Vector3.new(18, 15, 50)
	action.name = string.format("(%.2f) Dynamic Sealing Palm Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Shadow"] = function()
-- Timestamp.
local lastShadowCloneTimestamp = nil

---@class Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	if self:distance(self.entity) > 80 then
		return
	end

	if lastShadowCloneTimestamp and os.clock() - lastShadowCloneTimestamp <= 1.0 then
		return
	end

	self:hook("target", function()
		return true
	end)

	lastShadowCloneTimestamp = os.clock()

	timing.fhb = false

	local action = Action.new()
	action._when = 300
	action._type = "Parry"
	action.ihbc = false
	action.hitbox = Vector3.new(50, 50, 50)
	action.name = "Shadow Timing"
	self:action(timing, action)
end

end

_MODULES["ShardCrit"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 860
	if distance >= 21 then
		action._when = math.min(650 + distance * 10.5, 1600)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(35, 20, 100)
	action.name = string.format("(%.2f) Dynamic Shard Arrancar Crit Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["Shibari"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(250 + distance * 10, 700)
	action._type = "Dash"
	action.hitbox = Vector3.new(18, 15, 50)
	action.name = string.format("(%.2f) Dynamic Shibari Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Slash"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(340 + distance * 5, 600)
	action._type = "Parry"
	action.hitbox = Vector3.new(20, 15, 60)
	action.name = string.format("(%.2f) Dynamic Slash Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["SliceMove"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	repeat
		task.wait()
	until self.track.TimePosition >= 0.60

	local action = Action.new()
	action._when = 0
	action._type = "Parry"
	action.hitbox = Vector3.new(25, 20, 25)
	action.name = string.format("(%.2f) Dynamic Balance Slice Timing", self.track.Speed)
	self:action(timing, action)
end

end

_MODULES["SnakeC"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(300 + distance * 6, 800)
	action._type = "Parry"
	action.hitbox = Vector3.new(40, 40, 100)
	action.name = string.format("(%.2f) Dynamic Snake C Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Specter"] = function()
-- Timestamp.
local lastSpecterTimestamp = nil

---@class Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	if self:distance(self.entity) > 12 then
		return
	end

	if lastSpecterTimestamp and os.clock() - lastSpecterTimestamp <= 1.0 then
		return
	end

	self:hook("target", function()
		return true
	end)

	lastSpecterTimestamp = os.clock()

	timing.fhb = false

	local action = Action.new()
	action._when = 0
	action._type = "Parry"
	action.ihbc = false
	action.hitbox = Vector3.new(15, 15, 15)
	action.name = "Shadow Timing"
	self:action(timing, action)
end

end

_MODULES["SpecterStep"] = function()
-- Timestamp.
local lastShadowTimestamp = nil

---@class Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	if self:distance(self.entity) > 12 then
		return
	end

	if lastShadowTimestamp and os.clock() - lastShadowTimestamp <= 1.0 then
		return
	end

	self:hook("target", function()
		return true
	end)

	lastShadowTimestamp = os.clock()

	timing.fhb = false

	local action = Action.new()
	action._when = 225
	action._type = "Start Block"
	action.ihbc = false
	action.hitbox = Vector3.new(20, 20, 20)
	action.name = "Start Timing"
	self:action(timing, action)

	local action2 = Action.new()
	action2._when = 400
	action2._type = "End Block"
	action2.hitbox = Vector3.new(40, 40, 40)
	action2.name = "End Timing"
	self:action(timing, action2)
end

end

_MODULES["Spirit"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(100 + distance * 7, 600)
	action._type = "Parry"
	action.hitbox = Vector3.new(20, 15, 60)
	action.name = string.format("(%.2f) Dynamic Spirit Shot Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["SplittingThunder"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 540
	if distance >= 17 then
		action._when = 560
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(20, 20, 45)
	action.name = string.format("(%.2f) Dynamic Splitting Thunder Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["StillSilver"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 850
	if distance >= 25 then
		action._when = math.min(850 + distance * 3.5, 1500)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(20, 20, 100)
	action.name = string.format("(%.2f) Dynamic Still Silver Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["SwordCrit"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 425
	if distance >= 14 then
		action._when += 225
	end
	if distance >= 17 then
		action._when += 50
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 20)
	action.name = string.format("(%.2f) Dynamic Sword Crit Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["Test"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 500
	if distance >= 13 then
		action._when = math.min(700 + distance * 10, 1000)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(20, 15, 25)
	action.name = string.format("(%.2f) Dynamic Scythe Crit Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["TriCero"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local action = Action.new()
	action._type = "Parry"
	action.hitbox = Vector3.new(30, 30, 170)
	action.name = "Keyframe Action"
	return self:akeyframe(action, 1.28)
end

end

_MODULES["TruePower"] = function()
-- Timestamp.
local lastPowerTimestamp = nil

---@class Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	if self:distance(self.entity) > 12 then
		return
	end

	if lastPowerTimestamp and os.clock() - lastPowerTimestamp <= 1.0 then
		return
	end

	self:hook("target", function()
		return true
	end)

	lastPowerTimestamp = os.clock()

	timing.fhb = true

	local action = Action.new()
	action._when = 920
	action._type = "Dash"
	action.ihbc = false
	action.hitbox = Vector3.new(12, 12, 12)
	action.name = "True Power Timing"
	self:action(timing, action)
end

end

_MODULES["Twinblade"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 350
	if distance >= 12 then
		action._when = 420
	end
	if distance >= 14 then
		action._when = 460
	end
	if distance >= 15 then
		action._when = 530
	end
	if distance >= 19 then
		action._when = 650
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 23)
	action.name = string.format("(%.2f) Dynamic Twinblade Crit Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["Versch"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 350
	if distance >= 19 then
		action._when = math.min(340 + distance * 5.5, 1500)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(20, 20, 68)
	action.name = string.format("(%.2f) Dynamic Quincy Versch Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["VizorCero"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local action = Action.new()
	action._type = "Parry"
	action.hitbox = Vector3.new(50, 50, 170)
	action.name = "Keyframe Action"
	return self:akeyframe(action, 1.415)
end

end

_MODULES["Volcanic"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(150 + distance * 2.5, 500)
	action._type = "Parry"
	action.hitbox = Vector3.new(20, 15, 24)
	action.name = string.format("(%.2f) Dynamic Volcanic Slide Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["Water"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = 440
	if distance >= 11 then
		action._when = math.min(290 + distance * 22.5, 2000)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(25, 15, 30)
	action.name = string.format("(%.2f) Dynamic Water X Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["WindPrison"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(460 + distance * 6, 900)
	action._type = "Parry"
	action.hitbox = Vector3.new(18, 15, 35)
	action.name = string.format("(%.2f) Dynamic Wind Prison Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["XAxisGun"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = 1500
	action._type = "Parry"
	action.hitbox = Vector3.new(15, 15, 80)
	action.name = string.format("(%.2f) Dynamic X-Axis Gun Timing", distance)

	return self:action(timing, action)
end

end

_MODULES["YamCrit"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)
	local action = Action.new()
	action._when = 490
	if distance >= 13 then
		action._when = math.min(630 + distance * 3.2, 1000)
	end
	if distance >= 19 then
		action._when = math.min(700 + distance * 2, 1400)
	end
	action._type = "Parry"
	action.hitbox = Vector3.new(23, 15, 28)
	action.name = string.format("(%.2f) Dynamic Yamato Critical Timing", distance)
	return self:action(timing, action)
end

end

_MODULES["ZanZ"] = function()
---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local distance = self:distance(self.entity)

	local action = Action.new()
	action._when = math.min(600 + distance * 5, 2000)
	action._type = "Parry"
	action.hitbox = Vector3.new(35, 35, 120)
	action.name = string.format("(%.2f) Dynamic Zangetsu Z Timing", distance)

	return self:action(timing, action)
end

end

--[[ Main.lua ]]--
-- Check for table that is shared between executions.
if not shared then
	return warn("No shared, no script.")
end

-- Initialize Luraph globals if they do not exist.
loadstring("getfenv().LPH_NO_VIRTUALIZE = function(...) return ... end")()

getfenv().PP_SCRAMBLE_NUM = function(...)
	return ...
end

getfenv().PP_SCRAMBLE_STR = function(...)
	return ...
end

getfenv().PP_SCRAMBLE_RE_NUM = function(...)
	return ...
end

---@module Utility.Profiler
local Profiler = require("Utility/Profiler")

---@module Lycoris
local Lycoris = require("Lycoris")

---Find existing instances and initialize the script.
local function initializeScript()
	-- Check if there's already another instance.
	if shared.Lycoris then
		-- Detach previous instance.
		shared.Lycoris.detach()

		-- Share the previous state.
		Lycoris.queued = shared.Lycoris.queued
	end

	-- Re-initialize under the new state.
	shared.Lycoris = Lycoris
	shared.Lycoris.init()
end

---This is called when the initalization errors.
---@param error string
local function onInitializeError(error)
	-- Warn that an error happened while initializing.
	warn("Failed to initialize.")
	warn(error)

	-- Warn traceback.
	warn(debug.traceback())

	-- Detach the current instance.
	Lycoris.detach()
end

-- Safely profile and initialize the script aswell as handle errors.
Profiler.run("Main_InitializeScript", function(...)
	return xpcall(initializeScript, onInitializeError, ...)
end)


--[[ Lycoris.lua ]]--
-- Detach and initialize a Lycoris instance.
local Lycoris = { queued = false, silent = false, dpscanning = false }

---@module Utility.Logger
local Logger = require("Utility/Logger")

---@module Menu
local Menu = require("Menu")

---@module Features
local Features = require("Features")

---@module Utility.ControlModule
local ControlModule = require("Utility/ControlModule")

---@module Game.Timings.SaveManager
local SaveManager = require("Game/Timings/SaveManager")

---@module Utility.Maid
local Maid = require("Utility/Maid")

---@module Utility.Signal
local Signal = require("Utility/Signal")

---@module Game.Timings.ModuleManager
local ModuleManager = require("Game/Timings/ModuleManager")

---@module Utility.CoreGuiManager
local CoreGuiManager = require("Utility/CoreGuiManager")

---@module Utility.PersistentData
local PersistentData = require("Utility/PersistentData")

---@module Game.PlayerScanning
local PlayerScanning = require("Game/PlayerScanning")

---@module Game.Keybinding
local Keybinding = require("Game/Keybinding")

-- Lycoris maid.
local lycorisMaid = Maid.new()

-- Constants.
local LOBBY_PLACE_ID = 14067600077

-- Services.
local playersService = game:GetService("Players")
local replicatedStorage = game:GetService("ReplicatedStorage")

-- Timestamp.
local startTimestamp = os.clock()

---Initialize instance.
function Lycoris.init()
	local localPlayer = nil

	repeat
		task.wait()
	until game:IsLoaded()

	repeat
		localPlayer = playersService.LocalPlayer
	until localPlayer ~= nil

	PersistentData.init()

	if isfile and isfile("smarker_ts.txt") then
		Lycoris.silent = true
	end

	if isfile and isfile("dpscanning_ts.txt") then
		Lycoris.dpscanning = true
	end

	if script_key and queue_on_teleport and not Lycoris.queued and not no_queue_on_teleport then
		-- String.
		local scriptKeyQueueString = string.format("script_key = '%s'", script_key or "N/A")
		local loadStringQueueString =
			'loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/0216eb5f95556e660be56009441409ae.lua"))()'

		-- Queue.
		queue_on_teleport(scriptKeyQueueString .. "\n" .. loadStringQueueString)

		-- Mark.
		Lycoris.queued = true

		-- Warn.
		Logger.warn("Script has been queued for next teleport.")
	else
		-- Fail.
		Logger.warn("Script has failed to queue on teleport because Luarmor internals or the function do not exist.")
	end

	local tslot = PersistentData.get("tslot")
	local tdestination = PersistentData.get("tdestination")

	if game.PlaceId == LOBBY_PLACE_ID and tslot and tdestination then
		local remotes = replicatedStorage:WaitForChild("Remotes")
		local chooseSlotRemote = remotes:WaitForChild("ChooseSlot")
		local teleportRemote = remotes:WaitForChild("Teleport")

		chooseSlotRemote:InvokeServer(tslot, nil)
		teleportRemote:InvokeServer({ teleportTo = tdestination })
	end

	PersistentData.set("tslot", nil)
	PersistentData.set("tdestination", nil)

	if game.PlaceId == LOBBY_PLACE_ID then
		return Logger.warn("Script has initialized in the lobby.")
	end

	local remotes = replicatedStorage:WaitForChild("Remotes")
	local vastoVfx = remotes:FindFirstChild("VastoVfx")

	if vastoVfx then
		vastoVfx:Destroy()
	end

	Logger.warn("Anticheat has been successfully penetrated.")

	local currentElo = "N/A"
	local eloType = "N/A"

	if game.PlaceId == 18637069183 then
		local playerGui = localPlayer.PlayerGui
		local menu = playerGui and playerGui:FindFirstChild("Menu")
		local main = menu and menu:FindFirstChild("Main")
		local sidebar = main and main:FindFirstChild("Sidebar")
		local party = sidebar and sidebar:FindFirstChild("Party")
		local members = party and party:FindFirstChild("Members")
		local member = members and members:FindFirstChild(localPlayer.UserId)
		local info = member and member:FindFirstChild("Info")
		local playerValue = info and info:FindFirstChild("PlayerValue")
		local elo = playerValue and playerValue:FindFirstChild("ELO")
		local eloTextValue = elo and elo:FindFirstChild("Value")

		currentElo = eloTextValue and tostring(eloTextValue.Text) or "N/A"

		local eloNumber = currentElo and tonumber(currentElo) or nil

		if eloNumber then
			eloType = "Medium"
		end

		if eloNumber and eloNumber <= 500 then
			eloType = "Low"
		end

		if eloNumber and eloNumber >= 1000 then
			eloType = "High"
		end

		if eloNumber and eloNumber >= 2000 then
			eloType = "Very High"
		end

		if eloNumber and eloNumber >= 2600 then
			eloType = "Leaderboard"
		end
	end

	if script_key then
		LRM_SEND_WEBHOOK(
			"https://discord.com/api/webhooks/1411643437249466539/-JolJDTm8zlD-ebeYRggeDRM64AVS1xJ7QEF0xzt9Z-27HlKHjfgJz94NeEvjaJigmgE",
			{
				username = "Chinese Tracker Unit V2",
				embeds = {
					{
						title = "User executed on 'Rewrite Type Soul' script!",
						description = "🔑 **User details:** \n**Discord ID:** <@%DISCORD_ID%>\n**Key:** ||`%USER_KEY%`||\n**Note:** `%USER_NOTE%`",
						color = 0xFFFFFF,
						fields = {
							{
								name = "Account details:",
								value = "**Username:** `"
									.. LRM_SANITIZE(localPlayer.Name, "[a-zA-Z0-9_]{2,60}")
									.. "`\n**User ID:** `"
									.. LRM_SANITIZE(localPlayer.UserId, "[0-9]{2,35}")
									.. "`\n**User Elo:** `"
									.. currentElo
									.. "`\n**User Elo Type:** `"
									.. eloType
									.. "`",
								inline = false,
							},
							{
								name = "Game details:",
								value = "**Game ID:** `"
									.. LRM_SANITIZE(game.PlaceId, "[0-9]{2,35}")
									.. "`\n**Game Name:** `"
									.. LRM_SANITIZE(game.Name, "[a-zA-Z0-9_]{2,60}")
									.. "`",
								inline = false,
							},
							{
								name = "IP:",
								value = "||%CLIENT_IP% :flag_%COUNTRY_CODE%:||",
								inline = true,
							},
						},
					},
				},
			}
		)
	end

	PlayerScanning.init()

	Keybinding.init()

	CoreGuiManager.set()

	SaveManager.init()

	ModuleManager.refresh()

	ControlModule.init()

	Features.init()

	Menu.init()

	Logger.notify("Script has been initialized in %ims.", (os.clock() - startTimestamp) * 1000)
end

---Detach instance.
function Lycoris.detach()
	lycorisMaid:clean()

	PlayerScanning.detach()

	Keybinding.detach()

	ModuleManager.detach()

	SaveManager.detach()

	Menu.detach()

	ControlModule.detach()

	Features.detach()

	CoreGuiManager.clear()

	Logger.warn("Script has been detached.")
end

-- Return Lycoris module.
return Lycoris


--[[ Features.lua ]]--
-- Features related stuff is handled here.
local Features = {}

---@module Features.Game.Movement
local Movement = require("Features/Game/Movement")

---@module Features.Visuals.Visuals
local Visuals = require("Features/Visuals/Visuals")

---@module Utility.Logger
local Logger = require("Utility/Logger")

---@module Features.Combat.Defense
local Defense = require("Features/Combat/Defense")

---@module Features.Game.AnimationVisualizer
local AnimationVisualizer = require("Features/Game/AnimationVisualizer")

---@modules Features.Combat.AttributeListener
local AttributeListener = require("Features/Combat/AttributeListener")

---@module Features.Game.Monitoring
local Monitoring = require("Features/Game/Monitoring")

---@module Features.Game.OwnershipWatcher
local OwnershipWatcher = require("Features/Game/OwnershipWatcher")

---@module Features.Exploits.Exploits
local Exploits = require("Features/Exploits/Exploits")

---@module Features.Game.Removal
local Removal = require("Features/Game/Removal")

---@module Features.Automation.Input
local Input = require("Features/Automation/Input")

---Initialize features.
---@note: Careful with features that have entire return LPH_NO_VIRTUALIZE(function() blocks. We assume that we don't care about what's placed in there.
function Features.init()
	Monitoring.init()
	AttributeListener.init()
	Defense.init()
	Visuals.init()
	Movement.init()
	OwnershipWatcher.init()
	Exploits.init()
	Removal.init()
	Input.init()

	-- Only initialize if we're a builder.
	if not armorshield or armorshield.current_role == "builder" then
		AnimationVisualizer.init()
	end

	Logger.warn("Features initialized.")
end

---Detach features.
function Features.detach()
	-- Only detach if we're a builder.
	if not armorshield or armorshield.current_role == "builder" then
		AnimationVisualizer.detach()
	end

	Monitoring.detach()
	AttributeListener.detach()
	Defense.detach()
	Movement.detach()
	Visuals.detach()
	OwnershipWatcher.detach()
	Exploits.detach()
	Removal.detach()
	Input.detach()

	Logger.warn("Features detached.")
end

-- Return Features module.
return Features


--[[ Menu.lua ]]--
-- Menu module.
local Menu = {}

---@module GUI.ThemeManager
local ThemeManager = require("GUI/ThemeManager")

---@module GUI.SaveManager
local SaveManager = require("GUI/SaveManager")

---@module GUI.Library
local Library = require("GUI/Library")

---@module Menu.CombatTab
local CombatTab = require("Menu/CombatTab")

---@module Menu.GameTab
local GameTab = require("Menu/GameTab")

---@module Menu.BuilderTab
local BuilderTab = require("Menu/BuilderTab")

---@module Menu.VisualsTab
local VisualsTab = require("Menu/VisualsTab")

---@module Menu.LycorisTab
local LycorisTab = require("Menu/LycorisTab")

---@module Menu.AutomationTab
local AutomationTab = require("Menu/AutomationTab")

---@module Menu.ExploitTab
local ExploitTab = require("Menu/ExploitTab")

---@module Utility.Logger
local Logger = require("Utility/Logger")

---@module Utility.Maid
local Maid = require("Utility/Maid")

---@module Utility.Signal
local Signal = require("Utility/Signal")

---@module Utility.Configuration
local Configuration = require("Utility/Configuration")

-- Services.
local runService = game:GetService("RunService")
local stats = game:GetService("Stats")
local players = game:GetService("Players")

-- Signals.
local renderStepped = Signal.new(runService.RenderStepped)

-- Maids.
local menuMaid = Maid.new()

-- Constants.
local MENU_TITLE = "Linoria V2 | Type Soul"

if LRM_UserNote then
	MENU_TITLE = string.format(
		"(Commit %s) Linoria V2 | Type Soul First Release",
		string.sub("8651ab54aacec4210aa23b4858646389a9292352", 1, 6)
	)
end

---Initialize menu.
function Menu.init()
	-- Create window.
	local window = Library:CreateWindow({
		Title = MENU_TITLE,
		Center = true,
		AutoShow = not shared.Lycoris.silent,
		TabPadding = 8,
		MenuFadeTime = 0.0,
	})

	-- Configure ThemeManager.
	ThemeManager:SetLibrary(Library)
	ThemeManager:SetFolder("Lycoris-Rewrite-TypeSoul-Themes")

	-- Configure SaveManager.
	SaveManager:SetLibrary(Library)
	SaveManager:IgnoreThemeSettings()
	SaveManager:SetFolder("Lycoris-Rewrite-TypeSoul-Configs")
	SaveManager:SetIgnoreIndexes({
		"Fly",
		"NoClip",
		"Speedhack",
		"InfiniteJump",
		"AttachToBack",
		"Invisibility",
	})

	-- Initialize all tabs.
	CombatTab.init(window)
	BuilderTab.init(window)
	GameTab.init(window)
	VisualsTab.init(window)
	ExploitTab.init(window)
	AutomationTab.init(window)
	LycorisTab.init(window)

	-- Last update.
	local lastUpdate = os.clock()

	-- Update watermark.
	menuMaid:add(renderStepped:connect(
		"Menu_WatermarkUpdate",
		LPH_NO_VIRTUALIZE(function()
			if os.clock() - lastUpdate <= 0.5 then
				return
			end

			lastUpdate = os.clock()

			-- Get stats.
			local networkStats = stats:FindFirstChild("Network")
			local workspaceStats = stats:FindFirstChild("Workspace")
			local performanceStats = stats:FindFirstChild("PerformanceStats")
			local serverStats = networkStats and networkStats:FindFirstChild("ServerStatsItem") or nil

			-- Get data.
			local pingData = serverStats and serverStats:FindFirstChild("Data Ping") or nil
			local heartbeatData = workspaceStats and workspaceStats:FindFirstChild("Heartbeat") or nil
			local cpuData = performanceStats and performanceStats:FindFirstChild("CPU") or nil
			local gpuData = performanceStats and performanceStats:FindFirstChild("GPU") or nil

			-- Set values.
			local ping = pingData and pingData:GetValue() or 0.0
			local fps = heartbeatData and heartbeatData:GetValue() or 0.0
			local cpu = cpuData and cpuData:GetValue() or 0.0
			local gpu = gpuData and gpuData:GetValue() or 0.0

			-- Character data.
			local mouse = players.LocalPlayer and players.LocalPlayer:GetMouse()
			local position = workspace.CurrentCamera and workspace.CurrentCamera.CFrame.Position
			local positionFormat = position and string.format("(%.2f, %.2f, %.2f)", position.X, position.Y, position.Z)
				or "N/A"

			-- String.
			local str = string.format("%s | %.2fms | %.1f/s | %.1fms | %.1fms", MENU_TITLE, ping, fps, cpu, gpu)

			if Configuration.expectToggleValue("ShowDebugInformation") then
				str = str .. string.format(" | %s", positionFormat)
				str = str .. string.format(" | %s", mouse and mouse.Target and mouse.Target:GetFullName() or "N/A")
			end

			-- Set watermark.
			Library:SetWatermark(str)
		end)
	))

	-- Configure Library.
	Library.ToggleKeybind = Options.MenuKeybind

	-- Load auto-load config.
	SaveManager:LoadAutoloadConfig()

	-- Log menu initialization.
	Logger.warn("Menu initialized.")
end

---Detach menu.
function Menu.detach()
	menuMaid:clean()

	Library:Unload()

	Logger.warn("Menu detached.")
end

-- Return Menu module.
return Menu


