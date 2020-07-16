class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.362.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.362.0/snyk-macos"
    sha256 "12d6fe14d9530247519f982a9a3b569598cddd4a6a49ca143faa10f9991361a1"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.362.0/snyk-linux"
    sha256 "b8044d9a8e73d94181aad7de27acea509f8a6366ce7b528eebf884f0e071acdc"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
