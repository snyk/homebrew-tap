class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.907.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.907.0/snyk-macos"
    sha256 "3d8fb03b28ac2681ed28a19cc81f25d34c10d788324127ff8c95768ecbe4a742"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.907.0/snyk-linux"
    sha256 "54ed2ad2d5c8595e6e0a8cb7d6b158bee75a1099bb56120397398239ba6f3b74"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
