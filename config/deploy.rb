$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "lib")
require File.join(File.dirname(__FILE__), "..", "lib","fs_scm.rb")

set :application, "testapp"
set :repository,  "/tmp/test_project"
set :use_sudo, false
# set :revision, 1



set :scm, "fs"
set :deploy_via, :copy

role :web, "192.168.1.138"
