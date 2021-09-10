class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.704.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.704.0/snyk-macos"
    sha256 "e16cc900c618b2bf2bf42ff4d4580de1f78e259eb511a7a8a17dab9555f3fe38"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.704.0/snyk-linux"
    sha256 "521b1da27b817b6e99977b0838e0fabccd0079d26cf70789b2ae58d706c21e94"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
