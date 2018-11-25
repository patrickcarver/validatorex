defmodule ValidatorexTest do
  use ExUnit.Case
  doctest Validatorex

  test "\"thingie\" is a string with only English letters" do
    assert { :ok, "thingie" } = Validatorex.only_english_letters("thingie") 
  end

  test "1 is not a string" do
    assert { :error, "value must be a string" } = Validatorex.only_english_letters(1)
  end

  test "\"thi1ng!3\" does not contain only English alphabetic characters" do
    assert { :error, "value must contain only English alphabetic characters" } =
      Validatorex.only_english_letters("th1ng!3")
  end

  test "\"adverb\" is in the list ~w[adverb adjective noun verb]" do
    list = ~w[adverb adjective noun verb]
    assert { :ok, "adverb" } = Validatorex.value_in_list("adverb", list)
  end

  test "\"conjunction\" is not in the list ~w[adverb adjective noun verb]" do
    list = ~w[adverb adjective noun verb]
    assert { :error, "value is not in the list" } = Validatorex.value_in_list("conjunction", list)
  end  
end
