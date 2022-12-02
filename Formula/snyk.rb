class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1065.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1065.0/snyk-macos"
    sha256 "7dbdc335fb640f70b9908bcf8f9bd220c8a57805da2b7840d8133ee5778a4345"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1065.0/snyk-linux"
    sha256 "de90f1ae1ac300ac66b50cb564d4e366ca4dc0bf24c8d392c45f23e3182793a1"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
