class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.932.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.932.0/snyk-macos"
    sha256 "8c70b8c79c3ffe0d31cffbba1b6379c4cb4d8385aa51f7a0a49f97c1a2cc0045"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.932.0/snyk-linux"
    sha256 "ff22814371044013ac286f7d8846cb63da0864defbdd3d60811e90653b4298bf"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
