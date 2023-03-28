class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1128.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1128.0/snyk-macos"
    sha256 "2a3d8e58486b28332b02d558565772626b42421e67eacd88c9a892046fe3ef22"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1128.0/snyk-linux"
    sha256 "68474216d5acf64f12b61ee2dea5a5bdf39ab645b5097389e2a8b5d88eec1153"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
