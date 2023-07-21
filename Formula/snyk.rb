class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1193.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1193.0/snyk-macos"
    sha256 "adaeed5df2aa6bf9adc1ab32abe0842fed3cb46df42ffe07fd243d1bfc54e05f"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1193.0/snyk-linux"
    sha256 "2d0fab4e0781ccab0bf8fe7bac67c77a812329f4e3a27963c088c60a60ae0fc3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
