class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1021.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1021.0/snyk-macos"
    sha256 "8b08ad6697c51c45d537db92e12b8b9daed20837100be7e4518f0b3cacb12938"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1021.0/snyk-linux"
    sha256 "70a08cfce281bcb8d4052e65bdcead5fa63752bf32ef9de86a5b4ebe852d479c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
