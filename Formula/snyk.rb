class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.849.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.849.0/snyk-macos"
    sha256 "f5b9724cbead2366b92be57279a8e882917e99b8191494c793d469fed23ea93f"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.849.0/snyk-linux"
    sha256 "9280bea7d1cec111640e9729526b6d26078cf8a1cb86f74dcbaafe5392ba37df"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
