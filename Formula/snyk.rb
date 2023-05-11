class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1154.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1154.0/snyk-macos"
    sha256 "678389a6216ce106bfa448847501db82ea476dce496e3671b77259c0b7c9babf"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1154.0/snyk-linux"
    sha256 "1ec9a9c8a489343a34cab7d68f5cf64bf146549178ff233f3e2b5f3e22249277"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
