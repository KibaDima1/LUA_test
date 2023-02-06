print("Мы начинаем")

print("Введите число")

local number = io.read()

function step1_sqrt(num)
    a = math.sqrt(num)
    if a % 2 == 0 then
        print("true")
    else
        print("false")
    end
end

step1_sqrt(number)