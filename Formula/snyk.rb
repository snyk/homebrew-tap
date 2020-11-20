class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.428.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.428.2/snyk-macos"
    sha256 "138c363475e3d68f8cdc75f7bd1ebdab00c60b09ff4ad141c45c3af04ec9c936"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.428.2/snyk-linux"
    sha256 "487136384cacb74c7cac1bdd6212e54f28a5d3601721f0988f4886e86a803cfc"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
