defmodule Example do
  require Integer
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)

  end

  def sum_and_average(numbers) do
    sum = Enum.sum(numbers)
    average = sum / Enum.count(numbers)
    {sum, average}
  end

  def print_numbers(numbers) do
    numbers |> Enum.join(" ") |> IO.puts()
  end

  def get_numbers_from_user do
    IO.puts("Enter numbers separated by spaces: ")
    user_input = IO.gets("") |> String.trim()
    String.split(user_input, " ") |> Enum.map(&String.to_integer/1)
  end

  def main do
    #numbers = ["1", "2", "3", "4", "5"]
    numbers = get_numbers_from_user()
    #Enum.each(numbers, fn num -> IO.puts(num) end)
    # result = Enum.map(numbers, &String.to_integer/1)
    # print_numbers(result)
    IO.inspect(sum_and_average(numbers))
    {sum, average} = sum_and_average(numbers)  #Destructure
    IO.puts("Sum: #{sum}, average: #{average}")
  end
end
