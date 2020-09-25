class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.400.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.400.0/snyk-macos"
    sha256 "03f4afc63ee7514867e995605d4dfd7fe14d8448fd952593c7d045bf15e1e40a"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.400.0/snyk-linux"
    sha256 "afe671696d3f7099aa44f483748c91961144796f73c9ca5d5018091cca29de44"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
