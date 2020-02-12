class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.291.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.291.0/snyk-macos"
    sha256 "8fece18e6a091eb5a2ec8c1fce9c65af0a36c00aa7a881fa822b90418ebe5cc2"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.291.0/snyk-linux"
    sha256 "5628012d9b8c2cfa0709cfcc5da2ba1b45849134c39c620dd0b16029edb91644"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
