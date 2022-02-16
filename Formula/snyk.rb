class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.853.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.853.0/snyk-macos"
    sha256 "b54291462c4f6e32a2de185c1f0853852fd5d4827630bc074eeb60bf19505047"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.853.0/snyk-linux"
    sha256 "93d564f556e41aa2a8e6494072ba9977faf25cf3a71c5a39e28d920e02e7c340"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
