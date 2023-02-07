function start()
    return coroutine.create(function()
        while true do
            print("Введите число")
            state_detail = {number = 0, detail = io.read()}
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
local function step1_number_or_not(start)
    return coroutine.create(function()
        while true do
            coroutine.resume(start)
            tonumber(state_detail.detail)
            coroutine.yield()
        end
    end)
end

-- шаг второй(взятие квадратного корня)
local function step2_sqrt(step1)
    return coroutine.create(function()
        while true do
            coroutine.resume(step1)
            state_detail.detail = math.sqrt(state_detail.detail)
            coroutine.yield()
        end
    end)
end

-- шаг третий(деление на 3)
local function step3_division_by_3(step2)
    while true do
        coroutine.resume(step2)
        state_detail.number = state_detail.number + 1
        print(state_detail.detail)
    end
end

start = start()

step1 = step1_number_or_not(start)

step2 = step2_sqrt(step1)

step3_division_by_3(step2)