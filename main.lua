-- проверка на целостность числа
local function integer_or_not()
    if detail % 1 ~= 0 then
        return false
    else
        return true
    end
end

local function start()
    return coroutine.create(function()
        while true do
            print("Введите число")
            status = true
            init = os.time()
            detail = io.read()
            coroutine.yield()
        end
    end)
end

-- шаг первый (проверка на то, являются ли введёные пользователем данные числом)
local function step1_number_or_not()
    return coroutine.create(function()
        while true do
            coroutine.resume(starts)
            print(os.difftime(os.time(),init))
            if (os.difftime(os.time(),init) >= 10) then
                status = false
            elseif ((tonumber(detail))) then
                status = true
            else
                status = false
            end
            coroutine.yield()
        end
    end)
end

-- шаг второй(взятие квадратного корня)
local function step2_sqrt()
    return coroutine.create(function()
        while true do
            coroutine.resume(step1)
            if (os.difftime(os.time(),init) == 10) then
                status = false
            end
            if status == true then
                detail = math.sqrt(detail)
                status = integer_or_not()
            end
            coroutine.yield()
        end
    end)
end

-- шаг третий(деление на 3)
local function step3_division_by_3()
    while true do
        coroutine.resume(step2)
        if (os.difftime(os.time(),init) == 10) then
            status = false
        end
        if status == true then
            detail = detail / 3
            status = integer_or_not()
            print("Конечно число = ", detail)
        end
        if status == false then
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

require "timer1"

local function listener( event )
    print( "listener called" )
end
  
timer1 = timer.performWithDelay( 2000, listener )