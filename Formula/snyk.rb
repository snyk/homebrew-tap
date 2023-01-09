class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1082.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1082.0/snyk-macos"
    sha256 "e6644ee7581ece35004538d39b9a4cf85fb7f322ddbe22a2698f4f4f4fe70825"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1082.0/snyk-linux"
    sha256 "8aa1560eb3aeee32d36967ffb8da80ba91966391fbfb08027e04afcd905527d1"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
