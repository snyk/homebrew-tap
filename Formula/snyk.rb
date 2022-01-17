class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.828.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.828.0/snyk-macos"
    sha256 "1523e22b6c02df7c215d5a96a6a42b2e6071e3231405f7d734d600d1a75f0d51"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.828.0/snyk-linux"
    sha256 "30bd730aaa03b0d9fc0b673b92c4fa5e23accd710a6e48e47115ce53a290be9f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
