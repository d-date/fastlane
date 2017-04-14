describe Fastlane do
  describe Fastlane::FastFile do
    describe "Push To Git Remote Action" do
      it "works without passing any options" do
        result = Fastlane::FastFile.new.parse("lane :test do
          push_to_git_remote
        end").runner.execute(:test)

        expect(result).to include("git push origin")
      end

      it "works with options specified" do
        result = Fastlane::FastFile.new.parse("lane :test do
          push_to_git_remote(
            remote: 'origin',
            local_branch: 'develop',
            remote_branch: 'remote_branch',
            force: true,
            tags: true
          )
        end").runner.execute(:test)

        expect(result).to include("git push origin develop:remote_branch")
        expect(result).to include("--force")
        expect(result).to include("--tags")
      end
    end
  end
end
