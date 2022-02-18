class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.855.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.855.0/snyk-macos"
    sha256 "8bacb996c0b75a1a0882e04b93c2a5c32a61f6a134a1b93ee08514db3484033f"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.855.0/snyk-linux"
    sha256 "d5f4be498f4cca95391c4aef87f191a51761feed587c7792da3ce8a309c3bff8"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
