class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.662.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.662.0/snyk-macos"
    sha256 "e8ac781d00edf5b3f9879016d953ab66788b95c2df7bef328174ea887c983250"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.662.0/snyk-linux"
    sha256 "e8253c346fc94919377cb75064a9ba3c17aa609419695e7d59fa77ccf2a9a90a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
