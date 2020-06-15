class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.339.3"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.339.3/snyk-macos"
    sha256 "edcff68a8e76cbf6a5a296ed18240242a4954a9450f65e2fba1aa68585dc2ee4"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.339.3/snyk-linux"
    sha256 "532c7258c5007b9755a73982a1ac01dccee04da3dd18a9056edb59677cc75d7d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
