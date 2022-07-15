class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.973.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.973.0/snyk-macos"
    sha256 "e4938c2f49d9329f9ea0f1731518346f1f991e8f308124a6a68d4cf19bc28775"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.973.0/snyk-linux"
    sha256 "ff12e1c21ad8c79aa6925b57e22e13f074a9814d1442ab4aed9167c6eafbbe9b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
