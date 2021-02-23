defmodule Danpay.NumbersTest do
  use ExUnit.Case

  alias Danpay.Numbers

  describe "sum_from_file/1" do
    test "when there is a file with given name, returns the sum of numbers" do
      file_read_response = Numbers.sum_from_file("numbers")

      expected_response = {:ok, %{result: 37}}

      assert file_read_response == expected_response
    end

    test "when there is no file with given name, returns errror" do
      file_read_response = Numbers.sum_from_file("banana")

      expected_response = {:error, "Invalid file format"}

      assert file_read_response == expected_response
    end
  end
end
