class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.873.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.873.0/snyk-macos"
    sha256 "73107f60a6e1c2dd723c452a09247cfd106d75d2620a38328f8243fc56b2c015"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.873.0/snyk-linux"
    sha256 "5c8965d1b7126d31ffa347f0fe99b5456e48c5db25505ca5920ae1fc1937a388"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
