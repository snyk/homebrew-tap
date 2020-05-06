class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.319.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.319.0/snyk-macos"
    sha256 "507c046b83b05df857889c3845f0041913d9b0a272b32034f102392fdca12815"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.319.0/snyk-linux"
    sha256 "58edbceb26ce9be0046e45655503b4cb7653119ec169b2460f2d5814eb1757b4"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
