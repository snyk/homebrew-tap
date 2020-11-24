class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.430.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.430.2/snyk-macos"
    sha256 "a9ddcadafafa1d7a661c7efe844f7dc14afae46dcbb9ac066dbc27a86926b22b"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.430.2/snyk-linux"
    sha256 "e60217d54f3d45fd1d2e9347fc3cf058725f9f27521058065b309d874b4542e9"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
