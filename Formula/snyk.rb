class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1179.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1179.0/snyk-macos"
    sha256 "e420e76dff3db2915fc1f218c17f311d484f3d468db9a07c1d6a6413717ed74e"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1179.0/snyk-linux"
    sha256 "fe1341647fbc55b0df8592ed077d099ec7f951a64763290584fcd0496e9c4fab"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
