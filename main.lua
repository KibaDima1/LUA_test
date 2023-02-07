local function start()
    return coroutine.create(function()
        while true do
            print("Введите число")
            state_detail = {state = true, detail = io.read()}
            coroutine.yield()
        end
    end)
end

-- проверка на целостность числа
local function integer_or_not()
    if state_detail.detail % 1 ~= 0 then
        return false
    else
        return true
    end
end

-- шаг первый (проверка на то, являются ли введёные пользователем данные числом)
local function step1_number_or_not()
    return coroutine.create(function()
        while true do
            local status
            coroutine.resume(starts)
            if ((tonumber(state_detail.detail))) then
                status = true
            else
                status = false
            end
            print(status)
            coroutine.yield(status)
        end
    end)
end

-- шаг второй(взятие квадратного корня)
local function step2_sqrt()
    return coroutine.create(function()
        while true do
            local status = coroutine.resume(step1)
            print(status)
            if status == true then
                state_detail.detail = math.sqrt(state_detail.detail)
                status = integer_or_not()
            end
            coroutine.yield(status)
        end
    end)
end

-- шаг третий(деление на 3)
local function step3_division_by_3()
    while true do
        local status = coroutine.resume(step2)
        print("step3")
        if status == true then
            state_detail.detail = state_detail.detail / 3
            status = integer_or_not()
            print(status)
            if status ~= true then
                print("система сломалась, если хотите продолжить, нажмите любую клавишу")
                io.read() 
            end
        end
    end
end

state_detail = {state = true, detail = 0}

starts = start()

step1 = step1_number_or_not()

step2 = step2_sqrt()

step3_division_by_3()