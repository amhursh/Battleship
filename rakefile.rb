task :default do
    FileList["./test/board_builder_test.rb", "./test/board_test.rb", "./test/communication_test.rb", "./test/space_test.rb", "./test/ship_test.rb", "./test/player_test.rb", "./test/game_runner_test.rb"].each { |file| ruby file } 
end
