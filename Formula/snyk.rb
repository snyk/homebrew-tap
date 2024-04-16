class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1288.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1288.1/snyk-macos"
    sha256 "2912c3d9b33547607302809a415a4e906fe235614d54a081eca7ccc48f016163"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1288.1/snyk-macos-arm64"
    sha256 "f93242dba71c9291e61f65c9510dc6f6bfc8a5eb5ea3adb71c85a7a50b4a2403"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1288.1/snyk-linux"
    sha256 "df7440c94becbb0ffa00dda457f871fe45dc5431476bcc71d81183b33143ad6f"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1288.1/snyk-linux-arm64"
    sha256 "e6d53d89849a3ddd07d58453ef084a3da1af99336d3b536e9afbb09d05f61fbd"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
