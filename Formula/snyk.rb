class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1073.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1073.0/snyk-macos"
    sha256 "81ced01a87409d2fb225a647af45f53f3ccc4e26560003926d3a125dab4afe38"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1073.0/snyk-linux"
    sha256 "9dd2d76de3576edcb6596f2521b4c386aa8e978d3ee115a1ee54f39db0ddf8da"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
