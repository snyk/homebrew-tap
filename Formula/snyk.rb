class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1104.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1104.0/snyk-macos"
    sha256 "910257285a5da8a3c60eaa3392140739cf96ef68c7221dcd2261c477555f1b22"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1104.0/snyk-linux"
    sha256 "6a078be22c8b62b8a57bf9207581a9849341f1a5b576c39a2ca790dbe0af78b4"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
