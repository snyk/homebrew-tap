class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.667.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.667.0/snyk-macos"
    sha256 "42dd97e2dd5a82b86a08c05297e8df9b998cbe6f4e9b285b12e9837b97aa8442"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.667.0/snyk-linux"
    sha256 "dd22e0842c71b122a4c7e8ddbadd2775e769fed0535210b6d6c08a2756841402"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
