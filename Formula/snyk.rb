class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1063.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1063.0/snyk-macos"
    sha256 "b37e0680bbe48b4452c068426d2b90d2b2802037c7e175d1e91d7a9c7c1c4279"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1063.0/snyk-linux"
    sha256 "ce09fa646c6c38fc7b324010ff0d043bebdb82463fe073b7a300373de42029dc"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
