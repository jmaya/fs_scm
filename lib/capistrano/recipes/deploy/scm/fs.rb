require 'capistrano/recipes/deploy/scm/base'

module Capistrano
  module Deploy
    module SCM
      class Fs < Base
        def head
          last_modified_directory
        end

        # Simply does a copy from the :repository directory to the
        # :destination directory.
        def checkout(revision, destination)
          !Capistrano::Deploy::LocalDependency.on_windows? ? "cp -R#{configuration[:copy_dereference_symlink]?'L':''} #{File.join(repository, revision.to_s)} #{destination}" : "xcopy #{File.join(repository,revision.to_s)} \"#{destination}\" /S/I/Y/Q/E"
        end

        alias_method :export, :checkout

        # No versioning, so this just returns the argument, with no
        # modification.
        def query_revision(revision)
          revision
        end

        # log: There's no log, so it just echos from and to.
        def log(from="", to="")
          "No SCM: #{from} - #{to}"
        end

        def last_modified_directory
          File.basename(Dir.glob(File.join(variable(:repository), "*")).reject {|f| File.file? f }.sort_by {|o| File.mtime(o) }.shift)
        end
      end
    end
  end
end
