class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1205.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1205.0/snyk-macos"
    sha256 "bdbf2571b1d63a894447a5a4ede3df748415ac38dbbc6481c1e20af70c24c1da"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1205.0/snyk-linux"
    sha256 "791572c92561ed9b2ce04b881085a3b61519ccbbdc5eba496828e64bf6275357"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
