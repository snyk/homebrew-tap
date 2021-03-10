class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.478.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.478.0/snyk-macos"
    sha256 "309f78fc5938d15dbdf4ac690a9de2b9c28791cb6595aa6b6d7cd59be728a78c"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.478.0/snyk-linux"
    sha256 "41eed0bf3767c7912b3c97b908a9bf2ea754d1dfdba146205269ed0b1f30dcde"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
