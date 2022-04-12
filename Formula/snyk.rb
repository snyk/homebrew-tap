class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.902.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.902.0/snyk-macos"
    sha256 "c2d1565c52f6813bae419b1b515d58abe0d28c4582dc60fa01625174513f4737"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.902.0/snyk-linux"
    sha256 "9771560317d1c4a6ae0053d00a6d3840361e7b76ec8a1442121a65a94289f113"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
