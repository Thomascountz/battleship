require_relative './lib/engine.rb'
require_relative './lib/console_ui.rb'

interface = ConsoleUI.new
engine = Engine.new(interface: interface)
engine.start
