-- Simple clock with Redstone signal at 18:10

local slot_no = 1      -- Duration of the signal in seconds
local signalDuration = 3      -- Duration of the signal in seconds
local sideDisable = "back"  -- The side that disables the program

turtle.select(slot_no)

-- Main function
while true do
    -- Clear the screen
    term.clear()
    term.setCursorPos(1, 1)

    -- Get the in-game time and format it correctly
    local gameTime = os.time()
    local formattedTime = textutils.formatTime(gameTime, true)
    local day = "Day " .. os.day()

    -- Display the information
    print("=========================")
    print("    MINECRAFT CLOCK      ")
    print("=========================")
    print("")
    print("Time: " .. formattedTime)
    print("Date: " .. day)
    print("")
    print("=========================")

    local has_block, block_data = turtle.inspect()
    if redstone.getInput(sideDisable) then
        print("Program disabled by redstone signal on the right side.")
        sleep(10)
    elseif turtle.getItemDetail().name ~= "ars_nouveau:ritual_sunrise" then
        print("No sunrise tablets in selected slot!")
        sleep(10)
    elseif (not has_block) or (block_data.name ~= "ars_nouveau:ritual_brazier") then
        print("Not pointing at ritual brazier!")
        sleep(10)
    else
        -- Check if the time is around 18:00 to 18:10
        if gameTime >= 18.000 and gameTime < 18.200 then
            print("\nIt is 18:10 in the game! Activating redstone...")
            turtle.place()
            redstone.setOutput("front", true)
            sleep(signalDuration)
            redstone.setOutput("front", false)
            sleep(60)
        end
    end

    -- Wait before refreshing (1 second)
    sleep(1)
end
