defmodule Player do

  defstruct marker: ""

  def build(marker) do
    %Player{marker: marker}
  end
end
