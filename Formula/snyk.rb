class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1266.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1266.0/snyk-macos"
    sha256 "c3f220f6e1b1038eaf4b7a53f3211cb2bc4154b4681e129b007acddde33358e8"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1266.0/snyk-macos-arm64"
    sha256 "a6d915a62bc609013ff013318f36093c01ee6208d6f42d9dc2fec49b6d23df72"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1266.0/snyk-linux"
    sha256 "d5754e31f6a08e7fa5adfae19c998d04e0439cd7804fc91f8c918fb99eabee04"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1266.0/snyk-linux-arm64"
    sha256 "38e66d1130df459aa446ab2a73f6a84028feb9e30b678e5dd494963bd601908b"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
