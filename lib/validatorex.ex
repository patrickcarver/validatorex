defmodule Validatorex do
  @moduledoc """
  Provides functions to check if submitted values are valid.
  """

  @doc """
  Checks if value is a string and contains only English letters
  """
  def only_english_letters(value) do
    value
    |> is_string()
    |> is_all_english_letters()    
  end

  defp is_string(value) do
    case is_binary(value) do
      true -> { :ok, value }
      false -> { :error, "value must be a string" }
    end       
  end

  defp is_all_english_letters({ :ok, value }) do
    case Regex.match?(~r/^[a-zA-Z]+$/, value) do
      true -> { :ok, value }
      false -> { :error, "value must contain only English alphabetic characters" }
    end    
  end

  defp is_all_english_letters({ :error, message }) do
    { :error, message }
  end

  @doc """
  Checks if string value does not exceed specified length
  """
  def is_less_than_length(value, limit) do
    case String.length(value) <= limit do
      true -> { :ok, value }
      false -> { :error, "value length exceeds limit" }
    end
  end

  def is_less_than_length({ :error, message }) do
    { :error, message }
  end

  @doc """
  Checks if value is within list
  """
  def value_in_list(value, list) do
    case value in list do
      true -> { :ok, value }
      false -> { :error, "value is not in the list" }
    end
  end
end
