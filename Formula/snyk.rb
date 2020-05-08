class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.319.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.319.2/snyk-macos"
    sha256 "709a83b4986d201ddc5637818f7b3d84982bdb39cd98423c9ab04260eaca2d6f"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.319.2/snyk-linux"
    sha256 "8891ec1eeceb9201823555522eb8e4a55b665a9789387e8332dd25fe4e10bf65"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
