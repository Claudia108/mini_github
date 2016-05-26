require 'test_helper'

class RepoHelperTest < ActionView::TestCase
    test "it formats repo names" do
      repo = Repo.all[0]
      formatted_name = RepoHelper.repo_name(repo)
      assert_equal "The_pivot", formatted_name
    end
end
