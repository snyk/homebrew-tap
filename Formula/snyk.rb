class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.842.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.842.0/snyk-macos"
    sha256 "92247c93d11533e47334f9c46107922f0f4a382150efa9963bf3de16584460c4"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.842.0/snyk-linux"
    sha256 "421d469ffbb56a33e987e18c9962504a46c905f16f857b614689ea8583609da8"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
