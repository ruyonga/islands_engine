defmodule IslandsEngine.Game do

  use GenServer
  alias IslandsEngine.{Game, Player}
  defstruct player1: :none, player2: :none

  # def handle_info(:first, state) do
  #   IO.puts "This message has been handled by handle_info/2 marching on :frst"
  #   {:noreply, state}
  # end

  def handle_call(:demo, _from, state) do
    {:reply, state, state}
  end

  def call_demo(game) do
    GenServer.call(game, :demo)
  end

  def handle_cast(:demo, state) do
    {:noreply, %{state | test: "new value"}}
  end

  # def cast_demo(pid) do
  #   GenServer.cast(pid, :demo)
  # end


  def start_link(name) when not is_nil name do
    GenServer.start_link(__MODULE__, name)
  end

  def init(name) do
    {:ok, player1} = Player.start_link(name)
    {:ok, player2} = Player.start_link()
    {:ok, %Game{ player1: player1, player2: player2}}
  end

end
